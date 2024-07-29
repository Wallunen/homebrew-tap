class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ad71512383e95761a6a59402977fb33824b61328bfae154ddfa0b8109993aade" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "87ad6a9113f82d8b7230a29f5b2236292b00ccaeba98c84a326ba07efb7e8c95" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7e181e5d8e55d5d1ad09f0f0f9285e43c4b4ef0d89c5226bdf8b9613491fd111" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.653+91c17979f.tar.xz"
  version "0.14.0-dev.653+91c17979f"
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
