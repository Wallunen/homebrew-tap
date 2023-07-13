class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fccdf9b3fbdb74f722fc1d149a963550c11d972cd47225db0506e8933f638f59" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0faee07776796f41f26ba21b9540048b3a76c2e5a134ea88434d998b5703b440" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "97e0126111a8c9d179ca4e802af4a976157c66c1aa3cbb8cff81b48b77d39d8d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3978+711b4e93e.tar.xz"
  version "0.11.0-dev.3978+711b4e93e"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
