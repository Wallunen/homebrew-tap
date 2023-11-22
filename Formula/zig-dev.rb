class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fedf66b6c87e12bff479b63fd2949af5bf62c8f45e30fc1ee4fcbb7376c77f5b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2bc977629aaf44d5530b4c0c6a3eb5ba1ec34579d67527858d6fe0efcd791cac" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "502bcd0d5842cddcff9e66647776f6d5c30bfe0a1678fd5c94ce4e56a9e45b46" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1676+40b8c993f.tar.xz"
  version "0.12.0-dev.1676+40b8c993f"
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
